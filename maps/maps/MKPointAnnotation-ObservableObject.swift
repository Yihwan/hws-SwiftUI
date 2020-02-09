//
//  MKPointAnnotation-ObservableObject.swift
//  maps
//
//  Created by Yihwan Kim on 2/9/20.
//  Copyright © 2020 Yihwan Kim. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }

        set {
            title = newValue
        }
    }

    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }

        set {
            subtitle = newValue
        }
    }
}
