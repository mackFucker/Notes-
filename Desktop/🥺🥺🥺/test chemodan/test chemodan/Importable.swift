//
//  Importable.swift
//  test chemodan
//
//  Created by дэвид Кихтенко on 04.07.2023.
//

import Foundation
import Photos
import UIKit

protocol Importable: AnyObject {
    func ImportFiles(completion: @escaping (String?) -> Void)
}

final class ImportPhoto: Importable {
    
    func ImportFiles(completion: @escaping (String?) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                if let asset = fetchResult.firstObject {
                    let requestOptions = PHImageRequestOptions()
                    requestOptions.isSynchronous = true
                    PHImageManager.default().requestImageData(for: asset, options: requestOptions) { imageData, _, _, _ in
                        if let data = imageData,
                           let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("photo.jpg") {
                            do {
                                try data.write(to: path)
                                completion(path.path)
                            } catch {
                                completion(nil)
                            }
                        } else {
                            completion(nil)
                        }
                    }
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }

}



