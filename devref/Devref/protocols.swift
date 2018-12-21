//
//  protocols.swift
//  Devref
//
//  Created by Konstantin on 24/10/2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit

// protocol to navigate us from MainMenu (3 buttons to list controller)
@objc protocol ButtonProtocol {
    @objc func buttonAction(_ sender: UIButton)
}


