//
//  CollectionViewCell.swift
//  homework5
//
//  Created by Dariya on 7/11/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private let bgView = UIView()
    
    private let sizeLbl = MakerView.shared.makeLabel(size: 16,
                                                     textColor: .systemGray,
                                                     textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()

    }
    
    private func initUI() {
        contentView.addSubview(bgView)
        setupConstrainsforBGView()
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(sizeLbl)
        setupConstrainsforSizeLbl()
    }
    
    private func setupConstrainsforBGView() {
        bgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupConstrainsforSizeLbl() {
        NSLayoutConstraint.activate([
        sizeLbl.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
        sizeLbl.centerYAnchor.constraint(equalTo: bgView.centerYAnchor)
        ])
    }
    
    func initDataCell(_ sizes: String) {
        sizeLbl.text = sizes
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
