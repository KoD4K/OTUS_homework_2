//
//  File.swift
//  
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

import UIKit
import SwiftUI

public struct ActivityView: UIViewRepresentable {
    
    public init() {}
    
    public func makeUIView(context: UIViewRepresentableContext<ActivityView>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: .medium)
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityView>) {
        uiView.startAnimating()
    }
    
}
