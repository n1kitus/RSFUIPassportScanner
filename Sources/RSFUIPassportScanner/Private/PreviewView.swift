//
//  PreviewView.swift
//
//
//  Created by Nikita Dobrov on 19/08/2024.
//

import AVFoundation
import UIKit

class PreviewView: UIView {
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        guard let layer = layer as? AVCaptureVideoPreviewLayer else {
            fatalError("""
            Expected `AVCaptureVideoPreviewLayer` type for layer.
            Check PreviewView.layerClass implementation.
            """)
        }

        return layer
    }

    var session: AVCaptureSession? {
        get { videoPreviewLayer.session }
        set { videoPreviewLayer.session = newValue }
    }

    // MARK: UIView

    override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
}
