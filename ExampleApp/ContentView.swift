//
//  ContentView.swift
//  ExampleApp
//
//  Created by Miniu on 29/11/2019.
//  Copyright © 2019 KB. All rights reserved.
//

import SwiftUI
import BarcodeKit

struct ContentView: View {
    let scanner: BarcodeScanner
    
    var body: some View {
        ZStack {
            BarcodeScannerCamera()
                .environmentObject(scanner.status)
                .environmentObject(scanner.preview)
                .onAppear(perform: {
                    self.scanner.core.startScanning()
                })
            
            BarcodeView()
                .environmentObject(scanner.output)
        }
        
    }
}
