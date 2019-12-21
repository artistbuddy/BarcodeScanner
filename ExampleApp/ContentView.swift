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
    let scanner = BarcodeScanner(config: .default)
    
    var body: some View {
        ZStack {
            BarcodeScannerCamera()
                .onAppear(perform: {
                    self.scanner.core.startScanning()
                })
            BarcodeView()
        }
        .barcodeKit(scanner)
    }
}
