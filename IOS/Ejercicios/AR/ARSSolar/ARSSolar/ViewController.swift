//
//  ViewController.swift
//  ARSSolar
//
//  Created by A1-IMAC08 on 17/2/22.
//

import UIKit
import ARKit

class ViewController: UIViewController
{
    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        // SUN
        let sunP = SCNVector3(0,0,-1)
        let sun = planet(geometry: SCNSphere(radius: 1), difusse: UIImage(named:"sol diffuse"), specular: nil, emission: nil, normal: nil, position: sunP)
        sun.runAction(rotation(time: 270))
        self.sceneView.scene.rootNode.addChildNode(sun)
        
        // MERCURY
        let mercury = planet(geometry: SCNSphere(radius: 0.04), difusse: UIImage(named: "mercury"), specular: nil, emission: nil, normal: nil, position: SCNVector3(1.2,0,0))
        let mercuryP = SCNNode()
        mercuryP.position = sunP
        let mercuryPAction = rotation(time: 8)
        mercuryP.runAction(mercuryPAction)
        mercuryP.addChildNode(mercury)
        mercury.runAction(rotation(time: 8))
        self.sceneView.scene.rootNode.addChildNode(mercuryP)
        
        // VENUS
        let venus = planet(geometry: SCNSphere(radius: 0.1), difusse: UIImage(named: "venus surface"), specular: nil, emission: UIImage(named: "venus atmosphere"), normal: nil, position: SCNVector3(1.4,0,0))
        let venusP = SCNNode()
        venusP.position = sunP
        let venusPAction = rotation(time: 50)//0.0224
        venusP.runAction(venusPAction)
        venusP.addChildNode(venus)
        venus.runAction(rotation(time: 10))
        self.sceneView.scene.rootNode.addChildNode(venusP)
        
        // EARTH
        let earth = planet(geometry: SCNSphere(radius: 0.1), difusse: UIImage(named: "tierra dia"), specular: UIImage(named: "tierra specular"), emission: UIImage(named: "tierra nubes"), normal: UIImage(named: "tierra normal"), position: SCNVector3(1.5,0,0))
        let earthP = SCNNode()
        earthP.position = sunP
        let earthPAction = rotation(time: 10)
        earthP.addChildNode(earth)
        earth.runAction(rotation(time: 1))
        earthP.runAction(rotation(time: 10))
        self.sceneView.scene.rootNode.addChildNode(earthP)
        
        // MOON
        let moon = planet(geometry: SCNSphere(radius: 0.025), difusse: UIImage(named: "luna"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0,0,-0.3))
        let moonP = SCNNode()
        let moonG = SCNNode()
        moonG.position = sunP
        moonP.position = SCNVector3(1.65,0,0)
        moonG.runAction(earthPAction)
        moonP.runAction(rotation(time: 27))
        moonP.addChildNode(moon)
        self.sceneView.scene.rootNode.addChildNode(moonP)
        moonG.addChildNode(moonP)
        self.sceneView.scene.rootNode.addChildNode(moonG)

        // MARS
        let mars = planet(geometry: SCNSphere(radius: 0.05), difusse: UIImage(named: "mars"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.3,0,0))
        let marsP = SCNNode()
        marsP.position = sunP
        marsP.addChildNode(mars)
        marsP.runAction(earthPAction)
        mars.runAction(rotation(time: 10))
        let marsPAction = rotation(time: 11)
        self.sceneView.scene.rootNode.addChildNode(marsP)
        
        // JUPITER
        let jupiter = planet(geometry: SCNSphere(radius: 0.35), difusse: UIImage(named: "jupiter"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.6,0,0))
        let jupiterP = SCNNode()
        jupiterP.position = sunP
        let jupiterPAction = rotation(time: 15)
        jupiterP.runAction(jupiterPAction)
        jupiterP.addChildNode(jupiter)
        jupiter.runAction(rotation(time: 15))
        self.sceneView.scene.rootNode.addChildNode(jupiterP)
        
        // SATURN 58232km 29,5 years
        let saturn = planet(geometry: SCNSphere(radius: 0.32), difusse: UIImage(named: "saturn"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3,0,0))
        let saturnP = SCNNode()
        saturnP.position = sunP
        let saturnPAction = rotation(time: 20)
        saturnP.runAction(saturnPAction)
        saturnP.addChildNode(saturn)
        saturn.runAction(rotation(time: 20))
        self.sceneView.scene.rootNode.addChildNode(saturnP)
        
        // URANUS 25362 84 years
        let uranus = planet(geometry: SCNSphere(radius: 0.2), difusse: UIImage(named: "uranus"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.3,0,0))
        let uranusP = SCNNode()
        uranusP.position = sunP
        let uranusPAction = rotation(time: 25)
        uranusP.runAction(uranusPAction)
        uranusP.addChildNode(uranus)
        uranus.runAction(rotation(time: 25))
        self.sceneView.scene.rootNode.addChildNode(uranusP)
        
        // NEPTUNE 49244 165 years
        let neptune = planet(geometry: SCNSphere(radius: 0.3), difusse: UIImage(named: "neptune"), specular: nil, emission: nil, normal: nil, position: SCNVector3(3.7,0,0))
        let neptuneP = SCNNode()
        neptuneP.position = sunP
        let neptunePAction = rotation(time: 30)
        neptuneP.runAction(neptunePAction)
        neptuneP.addChildNode(neptune)
        neptune.runAction(rotation(time: 30))
        self.sceneView.scene.rootNode.addChildNode(neptuneP)
}

    func planet(geometry: SCNGeometry, difusse:UIImage?,specular:UIImage? ,emission:UIImage?, normal:UIImage?, position: SCNVector3)-> SCNNode
    {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = difusse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        return planet
    }
    
    func rotation (time: TimeInterval)->SCNAction
    {
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: time)
        let forever = SCNAction.repeatForever(action)
        return forever
    }
}

extension Int
{
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
