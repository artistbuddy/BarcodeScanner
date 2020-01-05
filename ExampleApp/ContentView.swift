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
    private let viewModel = ViewModel()
    @State private var state = BarcodeScannerState.failure(reason: "")
    @State private var barcode = ""
    
    
    var body: some View {
        ZStack {
            BarcodeScannerCamera(state: $state)
                .onReceive(viewModel.scanner.status.$isScanning, perform: {
                    let scanning = BarcodeScannerState.scanning(videoPreview: self.viewModel.scanner.preview.videoOutput)
                    let failure = BarcodeScannerState.failure(reason: "no preview available")
                    self.state = $0 ? scanning : failure
                })
            
            BarcodeView(barcode: $barcode)
                .onReceive(viewModel.scanner.output.$barcodes.map{ $0.last?.value ?? "no barcode" }, perform: {
                    self.barcode = $0
                })
        }
    }
}

fileprivate extension ContentView {
    class ViewModel: ObservableObject {
        let scanner = BarcodeScanner(config: .default)
        
        init() {
            scanner.core.startScanning()
        }
    }
}
