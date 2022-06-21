//
//  ViewController.swift
//  worldTracking
//
//  Created by A1-IMAC08 on 3/2/22.
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
        
        // Configurar opciones y ejecurtar el sceneView
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]/// .showFeaturePoints para ver los puntos // .showWorldOrigin para ver eje de coordenadas
        self.sceneView.session.run(configuration)
        
        // Activar Iluminacion de scena
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    
    @IBAction func dibujarBT(_ sender: Any)
    {
        // Vamos a definir un nodo
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green /// Añadir color
        node.geometry?.firstMaterial?.specular.contents = UIColor.red /// para añadir otro color a la sombra, pero para ello debemos de tener activada la luz en la escena
        // Posicion aleatoria
        let x = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        
        node.position = SCNVector3(x, y, z)
//        node.position = SCNVector3(x: 0, y: 0, z: -0.3) /// donde aparecera el objeto
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func capsulaBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNCapsule(capRadius: 0.05, height: 0.3)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node.geometry?.firstMaterial?.specular.contents = UIColor.red
        // Posicion aleatoria
        let x = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x, y, z)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func cilindroBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNCylinder(radius: 0.06, height: 0.3)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node.geometry?.firstMaterial?.specular.contents = UIColor.red
        // Posicion aleatoria
        let x = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x, y, z)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    
    @IBAction func esferaBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.3)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node.geometry?.firstMaterial?.specular.contents = UIColor.red
        // Posicion aleatoria
        let x = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x, y, z)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func tuboBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNTube(innerRadius: 0.001, outerRadius: 0.002, height: 0.03)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node.geometry?.firstMaterial?.specular.contents = UIColor.red
        // Posicion aleatoria
        let x = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x, y, z)

        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    
    @IBAction func conoBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.1, height: 0.3)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node.geometry?.firstMaterial?.specular.contents = UIColor.red
        // Posicion aleatoria
        let x = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x, y, z)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func planoBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNPlane(width: 0.3, height: 0.25)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node.geometry?.firstMaterial?.specular.contents = UIColor.red
        // Posicion aleatoria
        let x = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x, y, z)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func piramideBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNPyramid(width: 0.11, height: 0.3, length: 0.3)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node.geometry?.firstMaterial?.specular.contents = UIColor.red
        // Posicion aleatoria
        let x = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x, y, z)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func anilloBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNTorus(ringRadius: 0.2, pipeRadius: 0.1)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        node.geometry?.firstMaterial?.specular.contents = UIColor.red
        // Posicion aleatoria
        let x = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = self.randomNumbers(firstNum: -0.3, secondNum: 0.3)
        node.position = SCNVector3(x, y, z)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func bezierPathBT(_ sender: Any)
    {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
        path.addLine(to: CGPoint(x: 0.4, y: 0))
        
        let shape = SCNShape(path: path, extrusionDepth: 0.2)
        let node = SCNNode()
        node.geometry = shape
        node.geometry?.firstMaterial?.specular.contents =  UIColor.red
        node.geometry?.firstMaterial?.diffuse.contents =  UIColor.yellow
        node.position = SCNVector3(0,0,-0.3)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func piramiudeAzulBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNPyramid(width: 0.01, height: 0.02, length: 0.02)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.position = SCNVector3(0.2, 0.3, -0.2)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func cilindroRojoBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNCylinder(radius: 0.02, height: 0.1)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        node.position = SCNVector3(-0.1, 0.5, -0.5)
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func boxBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNCylinder(radius: 0.02, height: 0.1)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        node.position = SCNVector3(-0.1, 0.5, -0.5)
        self.sceneView.scene.rootNode.addChildNode(node)
        
        // Esto seria para meter una caja dentro de otro objeto o asi
//        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
//        boxNode.position = SCNVector3(0,0,0)
//        node.addChildNode(boxNode)
        let cilindroNode = SCNNode(geometry: SCNCylinder(radius: 0.1, height: 0.3))
        cilindroNode.position = SCNVector3(0,0,0)
        cilindroNode.eulerAngles = SCNVector3(Float(90.degreesToRadians), 0, 0) /// aqui estamos girando en X
        self.sceneView.scene.rootNode.addChildNode(cilindroNode)
    }
    
    @IBAction func resetBT(_ sender: Any)
    {
        self.restartSession()
    }
    
    func restartSession()
    {
        self.sceneView.session.pause()
        // Eliminar todos los nodos que hayamos creado
        self.sceneView.scene.rootNode.enumerateChildNodes
        {(node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
    }

    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat
    {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

extension Int
{
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
