//
//  BarcodeView.swift
//  ExampleApp
//
//  Created by Miniu on 30/11/2019.
//  Copyright © 2019 KB. All rights reserved.
//

import SwiftUI
import BarcodeKit

struct BarcodeView: View {
    @Binding var barcode: String
    
    var body: some View {
        Text(barcode)
            .font(.system(.headline))
            .padding(10)
            .background(Color.gray.opacity(0.5))
    }
}
