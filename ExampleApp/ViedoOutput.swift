//
//  ViedoOutput.swift
//  ExampleApp
//
//  Created by Miniu on 29/11/2019.
//  Copyright © 2019 KB. All rights reserved.
//

import SwiftUI

struct VideoOutput: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VideoOutput>) {
        uiView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 300))
    }
    
    typealias UIViewType = UIView
    
    let view: UIView
    
    func makeUIView(context: UIViewRepresentableContext<VideoOutput>) -> VideoOutput.UIViewType {
        view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 300))
        return view
    }
}

