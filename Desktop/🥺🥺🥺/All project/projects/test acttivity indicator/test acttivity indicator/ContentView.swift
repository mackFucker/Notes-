//
//  ContentView.swift
//  test acttivity indicator
//
//  Created by дэвид Кихтенко on 05.06.2023.
//

import SwiftUI

struct ActivityIndicatorView: View {
 
    
    var body: some View {
        VStack {
            Image(systemName: "icloud.slash")
                .resizable()
                .frame(width: 90, height: 80)
                .foregroundColor(.purple)
            Button("Повторить", action: {
                print("Повторить")
            }).font(.system(size: 16, weight: .bold, design: .default))

            .frame(width: 120, height: 50)
            .background(.purple)
            .foregroundColor(.white)
            .cornerRadius(25)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
