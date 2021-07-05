//
//  HeaderView.swift
//  Base
//
//  Created by Van Do on 7/5/21.
//

import UIKit

@IBDesignable
class HeaderView: UIView {
  
  @IBInspectable
  public var title: String = "" {
    didSet {
      titleLabel.text = title
    }
  }
  
  @IBOutlet private weak var view: UIView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var backButton: UIButton!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  open func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
    backButton.addTarget(target, action: action, for: controlEvents)
  }
  
  private func setup() {
    view = loadViewFromNib()
    view.frame = bounds
    view.backgroundColor = .clear
    
    view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
    
    addSubview(view)
  }
  
  private func loadViewFromNib() -> UIView! {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    
    return view
  }
  
  @IBAction func backButtonTouch(_ sender: UIButton) {
    
  }
  
}
