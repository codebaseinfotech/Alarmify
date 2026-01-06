//
//  UIFont+Extention.swift
//  TorettoRecovery
//
//  Created by Ankit Gabani on 29/12/25.
//

import Foundation
import UIKit

extension UIFont {

    struct AppFont {

        // MARK: - Black
        static func black(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Black", size: size)!
        }

        static func blackItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-BlackItalic", size: size)!
        }

        // MARK: - Bold
        static func bold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Bold", size: size)!
        }

        static func boldItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-BoldItalic", size: size)!
        }

        // MARK: - ExtraBold
        static func extraBold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-ExtraBold", size: size)!
        }

        static func extraBoldItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-ExtraBoldItalic", size: size)!
        }

        // MARK: - ExtraLight
        static func extraLight(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-ExtraLight", size: size)!
        }

        static func extraLightItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-ExtraLightItalic", size: size)!
        }

        // MARK: - Italic
        static func italic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Italic", size: size)!
        }

        // MARK: - Light
        static func light(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Light", size: size)!
        }

        static func lightItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-LightItalic", size: size)!
        }

        // MARK: - Medium
        static func medium(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Medium", size: size)!
        }

        static func mediumItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-MediumItalic", size: size)!
        }

        // MARK: - Regular
        static func regular(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Regular", size: size)!
        }

        // MARK: - SemiBold
        static func semiBold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-SemiBold", size: size)!
        }

        static func semiBoldItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-SemiBoldItalic", size: size)!
        }

        // MARK: - Thin
        static func thin(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Thin", size: size)!
        }

        static func thinItalic(_ size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-ThinItalic", size: size)!
        }
    }
}
