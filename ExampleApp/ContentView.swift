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
    @State private var scanner = BarcodeScannerConfigurator.default
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                self.make(view: try! self.scanner.get().videoOutput).frame(width: reader.frame(in: .global).width, height: reader.frame(in: .global).height)
                Text(try! self.scanner.get().barcodes.first?.value ?? "no barcode")
            }
        }
        
    }
    
    func make(view: UIView) -> some View {
        try! self.scanner.get().startScanning()
        return VideoOutput(view: view)
    }
}
