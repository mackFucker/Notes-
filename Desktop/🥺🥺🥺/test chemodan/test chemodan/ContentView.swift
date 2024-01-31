//
//  ContentView.swift
//  test chemodan
//
//  Created by дэвид Кихтенко on 04.07.2023.
//

import SwiftUI

struct ContentView: View {
    let importPhoto = ImportPhoto()
    
    var body: some View {
        VStack {
            Text("allah")
        }
        .onAppear {
            { (status) in
                switch status {
                case .authorized:
                    self.openPhotoLibrary()
                case .denied, .restricted:
                    print("Access to photo library denied")
                case .notDetermined:
                    print("Access to photo library not determined")
                @unknown default:
                    fatalError()
                }
            }
        }) {
            Text("Request Photo Library Access")
            
        }
        .padding()
    }
    
    #Preview {
        ContentView()
    }
