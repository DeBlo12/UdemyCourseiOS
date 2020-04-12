//
//  ViewController.swift
//  SeeFood
//
//  Created by Ivo Specht on 12/04/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
    }
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML Model failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            
            if let error = error {
                print(error)
                return
            } else {
                guard let results = request.results as? [VNClassificationObservation] else {
                    fatalError("Failed to assign request results into array.")
                }
                
                if let firstResult = results.first {
                    
                    // Takes the description of results and splits the potential identifiers into individual strings.
                    let description = firstResult.identifier.split(separator: ",")
                    let uppercasedDescription = description[0].capitalized
                    
                    let confi = firstResult.confidence * 100
                    let confiString = String(format: "%.1f", confi)
                    
                    if firstResult.identifier.contains("hotdog") {
                        self.navigationItem.title = "It's a \(uppercasedDescription) with \(confiString)% certainty."
                    } else {
                        self.navigationItem.title = "It's a \(uppercasedDescription) with \(confiString)% certainty."
                    }
                }
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            
            guard let ciImage = CIImage(image: image) else {
                fatalError("Unable to convert to CIImage")
            }
            
            detect(image: ciImage)
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
}
