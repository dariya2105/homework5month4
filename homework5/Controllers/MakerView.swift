//
//  MakerView.swift
//  homework5
//
//  Created by Dariya on 7/11/23.
//

import UIKit

class MakerView {
    static let shared = MakerView()
    
    func makeLabel(text: String = "",
                   size: CGFloat = 12,
                   weight: UIFont.Weight = .regular,
                   textColor: UIColor = .black,
                   numberOfLines: Int = 0,
                   textAlignment: NSTextAlignment = .left,
                   backgroundColor: UIColor = .clear,
                   lineBreakMode: NSLineBreakMode = .byWordWrapping,
                   isFrameLayouts: Bool = false,
                   lineSpacing: CGFloat = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        label.backgroundColor = backgroundColor
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = isFrameLayouts
        
        if lineSpacing > 0 {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            label.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
        return label
    }
    
    func makeButton(setTitle: String = "",
                    setTitleColor: UIColor = .white,
                    backgroundColor: UIColor = .clear,
                    cornerRadius: CGFloat = 0,
                    tintColor: UIColor = .clear,
                    fontSize: CGFloat = 0,
                    fontWeight: UIFont.Weight = .bold,
                    imageName: String = "",
                    borderWidth: CGFloat = 0,
                    borderColor: CGColor = UIColor.clear.cgColor,
                    systemImageName: String = "",
                    isFrameLayouts: Bool = false,
                    shadowColor: CGColor = UIColor.clear.cgColor,
                    shadowOpacity: Float = 0,
                    shadowOffsetWidth: CGFloat = 0,
                    shadowOffsetHeight: CGFloat = 0,
                    shadowRadius: CGFloat = 0
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(setTitle, for: .normal)
        button.setTitleColor(setTitleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.tintColor = tintColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        let image = UIImage(named: imageName)
        button.setImage(image, for: .normal)
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
        let systemImage = UIImage(systemName: systemImageName)
        button.setImage(systemImage, for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = isFrameLayouts
        
        button.layer.shadowColor = shadowColor
        button.layer.shadowOpacity = shadowOpacity
        button.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        button.layer.shadowRadius = shadowRadius
        return button
    }
    
    func makeImageView(imageName: String = "",
                       clipsToBounds: Bool = true,
                       cornerRadius: CGFloat = 0,
                       contentMode: UIView.ContentMode,
                       isFrameLayouts: Bool = false) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.clipsToBounds = clipsToBounds
        imageView.layer.cornerRadius = cornerRadius
        imageView.contentMode = contentMode
        imageView.translatesAutoresizingMaskIntoConstraints = isFrameLayouts
        return imageView
    }
    
    func makeView(backgroundColor: UIColor = .clear,
                  cornerRadius: CGFloat = 0,
                  isFrameLayouts: Bool = false) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = isFrameLayouts
        return view
    }
}
