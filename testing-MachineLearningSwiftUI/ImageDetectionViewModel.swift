//
//  ImageDetectionViewModel.swift
//  testing-MachineLearningSwiftUI
//
//  Created by Diego Salazar Arp on 27-08-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class ImageDetectionViewModel: ObservableObject {
    
  var name: String = ""
        var manager: ImageDetectionManager
        
        @Published var predictionLabel: String = ""
        
        init(manager: ImageDetectionManager) {
            self.manager = manager
        }
        
        func detect(_ name: String) {
            
            let sourceImage = UIImage(named: name)
            
            guard let resizedImage = sourceImage?.resizeImage(targetSize: CGSize(width: 224, height: 224)) else {
                fatalError("Unable to resize the image!")
            }
            
            if let label = self.manager.detect(resizedImage) {
                self.predictionLabel = label
            }
          
        }
        
    }
