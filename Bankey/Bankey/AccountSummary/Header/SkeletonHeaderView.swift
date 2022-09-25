//
//  SkeletonHeaderView.swift
//  Bankey
//
//  Created by Rafael Benjamin on 28/09/22.
//

import UIKit

extension SkeletonHeaderView: SkeletonLoadable {}

class SkeletonHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let shakeyBellView = ShakeyBellView()
    
    let welcomeLayer = CAGradientLayer()
    let nameLayer = CAGradientLayer()
    let dateLayer = CAGradientLayer()
    
    struct ViewModel {
        let welcomeMessage: String
        let name: String
        let date: Date
        
        var dateFormatted: String {
            return date.monthDayYearString
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupLayers()
        setupAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        welcomeLayer.frame = welcomeLabel.bounds
        welcomeLayer.cornerRadius = welcomeLabel.bounds.height/2
        
        nameLayer.frame = nameLabel.bounds
        nameLayer.cornerRadius = nameLabel.bounds.height/2
        
        dateLayer.frame = dateLabel.bounds
        dateLayer.cornerRadius = dateLabel.bounds.height/2
    }
    
    private func commonInit() {
        let bundle = Bundle(for: SkeletonHeaderView.self)
        bundle.loadNibNamed("SkeletonHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = appColor
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        setupShakeyBell()
        self.shakeyBellView.buttonView.setTitle("0", for: .normal)
    }
    
    private func setupShakeyBell() {
        shakeyBellView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(shakeyBellView)
        
        NSLayoutConstraint.activate([
            shakeyBellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shakeyBellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(viewModel: ViewModel) {
        welcomeLabel.text = viewModel.welcomeMessage
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.dateFormatted
    }
    
}

extension SkeletonHeaderView {
    
    private func setupLayers() {
        welcomeLayer.startPoint = CGPoint(x: 0, y: 0.5)
        welcomeLayer.endPoint = CGPoint(x: 1, y: 0.5)
        welcomeLabel.layer.addSublayer(welcomeLayer)
        
        nameLayer.startPoint = CGPoint(x: 0, y: 0.5)
        nameLayer.endPoint = CGPoint(x: 1, y: 0.5)
        nameLabel.layer.addSublayer(nameLayer)

        dateLayer.startPoint = CGPoint(x: 0, y: 0.5)
        dateLayer.endPoint = CGPoint(x: 1, y: 0.5)
        dateLabel.layer.addSublayer(dateLayer)
    }
    
    private func setupAnimation() {
        let welcomeGroup = makeAnimationGroup()
        welcomeGroup.beginTime = 0.0
        welcomeLayer.add( welcomeGroup, forKey: "backgroundColor")
        
        let nameGroup = makeAnimationGroup(previousGroup: welcomeGroup)
        nameLayer.add(nameGroup, forKey: "backgroundColor")
        
        let dateGroup = makeAnimationGroup(previousGroup: nameGroup)
        dateLayer.add(dateGroup, forKey: "backgroundColor")
    }
    
}
