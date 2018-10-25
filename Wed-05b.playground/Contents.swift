

// Created on: 03-Oct-2018
// Created by: Wendi Yu
// Created for: ICS3U
// This program is a SpriteKit template is use start button move to the next scene with sound

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

class SplashScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let splashSceneBackground = SKSpriteNode(imageNamed: "IMG_8599.JPG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 3.0)
    
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        splashSceneBackground.position = CGPoint(x: (frame.size.width / 2) , y: (frame.size.height / 2))
        splashSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        splashSceneBackground.name = "splash Scene Background"
        self.addChild(splashSceneBackground)
        splashSceneBackground.setScale(0.25)
        
        splashSceneBackground.run(moveToNextSceneDelay) {
            //run code here after 3 secs
            let mainMenuScene = MainMenuScene(size: self.size)
            self.view!.presentScene(mainMenuScene)
        }
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        let mainMenuScene = MainMenuScene(size: self.size)
        self.view!.presentScene(mainMenuScene)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let ship = SKSpriteNode(imageNamed: "IMG_8607.PNG")
    let startButton = SKSpriteNode(imageNamed: "start.png")
    
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        ship.position = CGPoint(x: (frame.size.width / 2) , y: 100)
        ship.name = "spaceship"
        self.addChild(ship)
        ship.setScale(0.65)
        
        startButton.position = CGPoint(x: (frame.size.width / 2) , y: (frame.size.height / 2))
        startButton.name = "start button"
        self.addChild(startButton)
        startButton.setScale(0.65)
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //when the start button is touched, it move to the main game
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "start button" {
                let mainGameScene = MainGameScene(size: self.size)
                self.view!.presentScene(mainGameScene)
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}
class MainGameScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let ship = SKSpriteNode(imageNamed: "IMG_8607.PNG")
    let alien = SKSpriteNode(imageNamed: "alien.png")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0.0, green:0.0, blue:0.0, alpha: 1.0)
        ship.position = CGPoint(x: (frame.size.width / 2) , y: 100)
        ship.name = "spaceship"
        self.addChild(ship)
        ship.setScale(0.65)
        
        alien.position = CGPoint(x:(frame.size.width / 7.5) , y: 350)
        alien.name = "enemy"
        self.addChild(alien)
        
        ship.run(SKAction.playSoundFileNamed("BarrelExploding.wav", waitForCompletion: false))
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}
// this will be commented out when code moved to Xcode

// set the frame to be the size for your iPad
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = SplashScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
