//
//  GaussianLockView.swift
//  GaussianLock
//
//  Created by Tony Abboud on 11/18/18.
//  Copyright © 2018 Tony Abboud. All rights reserved.
//

import ScreenSaver
import AppKit

class GaussianLockView: ScreenSaverView {

    var image : NSImage?

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        loadImage()
    }

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        loadImage()
    }

    override func draw(_ rect: NSRect) {
        super.draw(rect)

        if let image = image {
            image.draw(in: rect)
        } else {
            // default to red, so we know something went wrong
            NSColor.red.setFill()
            rect.fill()
            NSColor.black.set()
        }
    }

    override var hasConfigureSheet: Bool {
        return false
    }

    override var configureSheet: NSWindow? {
        return nil
    }

    public func captureScreenToPath(_ destination: URL) -> URL {
        let img = CGDisplayCreateImage(CGMainDisplayID())
        let dest = CGImageDestinationCreateWithURL(destination as CFURL, kUTTypePNG, 1, nil)
        CGImageDestinationAddImage(dest!, img!, nil)
        CGImageDestinationFinalize(dest!)
        return destination
    }

    func captureScreenToData() -> NSData {
        let img = CGDisplayCreateImage(CGMainDisplayID())
        let storage = NSMutableData.init()
        let dest = CGImageDestinationCreateWithData(storage, kUTTypePNG, 1, nil)
        CGImageDestinationAddImage(dest!, img!, nil)
        CGImageDestinationFinalize(dest!)
        return storage
    }

    func loadImage() {
        let data = self.captureScreenToData()
        self.image = NSImage.init(data: data as Data)!
        self.needsDisplay = true
    }
}
