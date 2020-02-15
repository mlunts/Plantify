//
//  ClassifierManager.swift
//  Plantify
//
//  Created by Marina Lunts on 05.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit
import CoreML
import Vision
import ImageIO

class ClassifierManager {
    
    // MARK: - properties
    
    static let shared = ClassifierManager()
    private var classifications: [VNClassificationObservation]? = nil
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: PlantsClassifier().model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    // MARK: - public
    
    func classifyFlower(for image: UIImage, completaion: @escaping (Plant?) -> Void) {
        updateClassifications(for: image)
        
        guard let classifications = classifications else {
            completaion(nil)
            return
        }
        
     
            let identifiedFlowerName = classifications.first?.identifier
            var identifiedFlower: Plant!
            
            for element in DatabaseManager.shared.fetchJSON() {
                if element.name == identifiedFlowerName!.capitalized {
                    identifiedFlower = element
                }
            }
            
            completaion(identifiedFlower)
        
    }
    
    // MARK: - private
    
    private func updateClassifications(for image: UIImage) {
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    func processClassifications(for request: VNRequest, error: Error?) {
        
        guard let results = request.results else {
            return
        }
        
        classifications = results as? [VNClassificationObservation]
        
        //                if classifications.isEmpty {
        //    //                self.classificationLabel.text = "Nothing recognized."
        //                } else {
        //
        //                    let topClassifications = classifications.prefix(1)
        ////                    self.classifiedObject = topClassifications[0].identifier
        ////
        ////                    self.performSegue(withIdentifier: "goToPlant", sender: nil)
        //                }
        //            }
    }
    
}
