//
//  Extension+UIImage.swift
//  Temp-Project
//
//  Created by Muang on 29/11/2562 BE.
//  Copyright © 2562 Khrongpop Phonngam. All rights reserved.
//

import UIKit

extension UIImage {
    func cropped(_ boundingBox: CGRect) -> UIImage? {
        let scale = self.scale
        var rect = boundingBox
        rect.size.width = rect.width * scale
        rect.size.height = rect.height * scale
        guard let cgImage = self.cgImage?.cropping(to: rect) else {
            return nil
        }
        return UIImage(cgImage: cgImage)
    }
    
}
