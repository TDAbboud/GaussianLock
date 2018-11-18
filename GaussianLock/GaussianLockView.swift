//
//  GaussianLockView.swift
//  GaussianLock
//
//  Created by Tony Abboud on 11/18/18.
//  Copyright © 2018 Tony Abboud. All rights reserved.
//

import ScreenSaver

class GaussianLockView: ScreenSaverView {
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func animateOneFrame() {
    }
    
    override func draw(_ rect: NSRect) {
        super.draw(rect)
    }
    
    override func startAnimation() {
        super.startAnimation()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    
    override var hasConfigureSheet: Bool {
        return false
    }
    
    override var configureSheet: NSWindow? {
        return nil
    }
    
}
