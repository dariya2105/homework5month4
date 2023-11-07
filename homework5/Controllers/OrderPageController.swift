//
//  ViewController.swift
//  homework5
//
//  Created by Dariya on 7/11/23.
//

import UIKit

class OrderPageController: UIViewController {
    
    private let backBtn = MakerView.shared.makeButton(cornerRadius: 12,
                                                      tintColor: .black,
                                                      imageName: "arrow",
                                                      shadowColor: UIColor.black.cgColor,
                                                      shadowOpacity: 0.5,
                                                      shadowOffsetWidth: 2,
                                                      shadowOffsetHeight: 2,
                                                      shadowRadius: 4)
    
    private let detailLbl = MakerView.shared.makeLabel(text: "Detail",
                                                       size: 26,
                                                       weight: .medium)
    
    private let heartBtn  = MakerView.shared.makeButton(cornerRadius: 12,
                                                        tintColor: .black,
                                                        imageName: "heart",
                                                        shadowColor: UIColor.black.cgColor,
                                                        shadowOpacity: 0.5,
                                                        shadowOffsetWidth: 2,
                                                        shadowOffsetHeight: 2,
                                                        shadowRadius: 4
    )
    private var isHeartRed = false
    
    private let pizzaLbl = MakerView.shared.makeLabel(text: "Pizza with \n Mushrooms",
                                                      size: 38,
                                                      weight: .bold,
                                                      numberOfLines: 2,
                                                      textAlignment: .center
    )
    
    private let pizzaImg = MakerView.shared.makeImageView(imageName: "pizza",
                                                          contentMode: .scaleToFill)
    
    private let chooseSizeLbl = MakerView.shared.makeLabel(text: "Choose the size",
                                                           size: 22,
                                                           weight: .medium)
    
    private var collectionViewSize: UICollectionView = {
        let view = UICollectionViewFlowLayout()
        view.itemSize = CGSize(width: 102, height: 38)
        view.scrollDirection = .horizontal
        view.minimumLineSpacing = 46
        view.sectionInset = UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 24)
        let vc = UICollectionView(frame: .zero, collectionViewLayout: view)
        vc.translatesAutoresizingMaskIntoConstraints = false
        vc.backgroundColor = .systemGray6
        return vc
    }()
    
    private let countView = MakerView.shared.makeView(backgroundColor: .systemGray4,
                                                      cornerRadius: 15)
    
    private let minusBtn = MakerView.shared.makeButton(tintColor: .black,
                                                       imageName: "minus")
    
    private let countLbl = MakerView.shared.makeLabel(text: "01",
                                                      size: 28,
                                                      weight: .bold)
    
    private let plusBtn = MakerView.shared.makeButton(tintColor: .black,
                                                      imageName: "plus")
    
    private let labelPrice = MakerView.shared.makeLabel(text: "Price",
                                                        size: 14,
                                                        weight: .bold,
                                                        textColor: .systemGray)
    
    private let priceCountLbl = MakerView.shared.makeLabel(text: "$12.00",
                                                           size: 24,
                                                           weight: .bold,
                                                           textColor: .systemGreen)
    
    private let addToCartBtn = MakerView.shared.makeButton(setTitle: "Add To Cart",
                                                           backgroundColor: UIColor(red: 0.999, green: 0.659, blue: 0, alpha: 1),
                                                           cornerRadius: 15,
                                                           fontSize: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        initUI()
    }
    var count = 1
    
    private func initUI() {
        view.addSubview(backBtn)
        setupConstraintsForBackBtn()
        
        view.addSubview(detailLbl)
        setupConstraintsForDetailLbl()
        
        view.addSubview(heartBtn)
        setupConstraintsForHeartBtn()
        
        view.addSubview(pizzaLbl)
        setupConstraintsForPizzaLbl()
        
        view.addSubview(pizzaImg)
        setupConstraintsForPizzaImg()
        
        view.addSubview(chooseSizeLbl)
        setupConstraintsForChooseSizeLbl()
        
        view.addSubview(collectionViewSize)
        setupConstraintsForCollectionViewSize()
        
        view.addSubview(countView)
        setupConstraintsForCountView()
        
        countView.addSubview(minusBtn)
        setupConstraintsForMinusBtn()
        
        countView.addSubview(countLbl)
        setupConstraintsForCountLbl()
        
        countView.addSubview(plusBtn)
        setupConstraintsForPlusLbl()
        
        view.addSubview(priceCountLbl)
        setupConstraintsForPriceCountLbl()
        
        view.addSubview(labelPrice)
        setupConstraintsForLabelPrice()
        
        view.addSubview(addToCartBtn)
        setupConstraintsForAddToCartBtn()
    }
    
    private func setupConstraintsForBackBtn() {
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            backBtn.heightAnchor.constraint(equalToConstant: 45),
            backBtn.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupConstraintsForDetailLbl() {
        NSLayoutConstraint.activate([
            detailLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 59)
        ])
    }
    
    private func setupConstraintsForHeartBtn() {
        NSLayoutConstraint.activate([
            heartBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            heartBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            heartBtn.widthAnchor.constraint(equalToConstant: 45),
            heartBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        heartBtn.addTarget(self, action: #selector(heartBtnTapped), for: .touchUpInside)
    }
    
    @objc func heartBtnTapped(_ sender: UIButton) {
        if isHeartRed {
            sender.backgroundColor = .clear
            isHeartRed = false
        } else {
            sender.backgroundColor = .red
            isHeartRed = true
        }
    }
    
    private func setupConstraintsForPizzaLbl() {
        NSLayoutConstraint.activate([
            pizzaLbl.topAnchor.constraint(equalTo: detailLbl.bottomAnchor, constant: 56),
            pizzaLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupConstraintsForPizzaImg() {
        NSLayoutConstraint.activate([
            pizzaImg.topAnchor.constraint(equalTo: pizzaLbl.bottomAnchor, constant: 35),
            pizzaImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pizzaImg.heightAnchor.constraint(equalToConstant: 229),
            pizzaImg.widthAnchor.constraint(equalToConstant: 296)
        ])
    }
    
    private func setupConstraintsForChooseSizeLbl() {
        NSLayoutConstraint.activate([
            chooseSizeLbl.topAnchor.constraint(equalTo: pizzaImg.bottomAnchor, constant: 42),
            chooseSizeLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupConstraintsForCollectionViewSize() {
        NSLayoutConstraint.activate([
            collectionViewSize.topAnchor.constraint(equalTo: chooseSizeLbl.bottomAnchor, constant: 42),
            collectionViewSize.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewSize.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewSize.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        collectionViewSize.dataSource = self
        collectionViewSize.delegate = self
        collectionViewSize.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setupConstraintsForMinusBtn() {
        NSLayoutConstraint.activate([
            minusBtn.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            minusBtn.leadingAnchor.constraint(equalTo: countView.leadingAnchor, constant: 30),
            minusBtn.heightAnchor.constraint(equalToConstant: 35),
            minusBtn.widthAnchor.constraint(equalToConstant: 35)
        ])
        
        minusBtn.addTarget(self, action: #selector(minusBtnTapped), for: .touchUpInside)
    }
    
    @objc func minusBtnTapped(_ sender: UIButton) {
        if count > 0 {
            count = count - 1
            countLbl.text = formatNumberWithLeadingZero(count)
            updatePriceLabel()
        }
    }
    
    private func setupConstraintsForCountLbl() {
        NSLayoutConstraint.activate([
            countLbl.centerXAnchor.constraint(equalTo: countView.centerXAnchor),
            countLbl.centerYAnchor.constraint(equalTo: countView.centerYAnchor)
        ])
    }
    
    private func setupConstraintsForPlusLbl() {
        NSLayoutConstraint.activate([
            plusBtn.centerYAnchor.constraint(equalTo: countView.centerYAnchor),
            plusBtn.trailingAnchor.constraint(equalTo: countView.trailingAnchor, constant: -30),
            plusBtn.heightAnchor.constraint(equalToConstant: 35),
            plusBtn.widthAnchor.constraint(equalToConstant: 35)
        ])
        plusBtn.addTarget(self, action: #selector(plusBtnTapped), for: .touchUpInside)
    }
    
    @objc func plusBtnTapped(_ sender: UIButton) {
        count = count + 1
        countLbl.text = formatNumberWithLeadingZero(count)
        updatePriceLabel()
    }
    
    private func setupConstraintsForLabelPrice() {
        NSLayoutConstraint.activate([
            labelPrice.bottomAnchor.constraint(equalTo: priceCountLbl.topAnchor),
            labelPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26)
        ])
    }
    
    private func setupConstraintsForPriceCountLbl() {
        NSLayoutConstraint.activate([
            priceCountLbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -38),
            priceCountLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26)
        ])
    }
    
    private func updatePriceLabel() {
        let price = count * 12
        priceCountLbl.text = "$\(price).00"
    }
    
    func formatNumberWithLeadingZero(_ number: Int) -> String {
        if number < 10 {
            return "0\(number)"
        } else {
            return "\(number)"
        }
    }
    
    private func setupConstraintsForAddToCartBtn() {
        NSLayoutConstraint.activate([
            addToCartBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            addToCartBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            addToCartBtn.heightAnchor.constraint(equalToConstant: 60),
            addToCartBtn.widthAnchor.constraint(equalToConstant: 178)
        ])
    }
}
    
    extension OrderPageController: UICollectionViewDataSource, UICollectionViewDelegate {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cell.layer.cornerRadius = 12
            cell.clipsToBounds = true
            let value = 8 + (indexPath.row * 12)
            cell.initDataCell("\(value) inch")
            return cell
        }
        
        private func setupConstraintsForCountView() {
            NSLayoutConstraint.activate([
                countView.topAnchor.constraint(equalTo: collectionViewSize.bottomAnchor, constant: 56),
                countView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                countView.heightAnchor.constraint(equalToConstant: 70),
                countView.widthAnchor.constraint(equalToConstant: 236)
            ])
        }
        
    }

