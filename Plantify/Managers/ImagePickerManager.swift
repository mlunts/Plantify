//
//  ImagePickerManager.swift
//  Plantify
//
//  Created by Marina Lunts on 21.04.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class ImagePickerManager {
    
    static let shared = ImagePickerManager()
    
    private let picker = UIImagePickerController()
    
    // MARK: - public
    
    func getImagePicker() -> UIAlertController {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            presentPhotoPicker(sourceType: .photoLibrary)
            return
        }
        
        let photoSourcePicker = UIAlertController()
        
        let takePhoto = UIAlertAction(title: L10n.takePhoto, style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .camera)
        }
        
        let choosePhoto = UIAlertAction(title: L10n.chooseFromLibrary, style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: L10n.cancelText, style: .cancel, handler: nil)
        
        photoSourcePicker.addAction(takePhoto)
        photoSourcePicker.addAction(choosePhoto)
        photoSourcePicker.addAction(cancelAction)
        
        present(photoSourcePicker, animated: true)
    }
    
    private func presentPhotoPicker(sourceType: UIImagePickerController.SourceType) {
        
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
    
}
