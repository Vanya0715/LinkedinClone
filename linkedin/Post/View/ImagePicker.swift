//
//  ImagePicker.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 29/07/22.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: Image?
    @Binding var isPickerShowing: Bool
    @Binding var imageData: Data
    
    func makeUIViewController(context: Context) ->  UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = true
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
       
    }
    func makeCoordinator() -> ImagePicker.Coordinator {
        Coordinator(_parent: self)
    }


class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_parent: ImagePicker) {
        self.parent = _parent
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("ImageSelected")
         let uiImage = info[.editedImage] as! UIImage
        parent.selectedImage = Image(uiImage: uiImage)
        if let mediaData = uiImage.jpegData(compressionQuality: 0.5) {
            parent.imageData = mediaData
        }
        parent.isPickerShowing = false
    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        parent.isPickerShowing = false
//    }
}
}
