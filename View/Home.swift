//
//  Home.swift
//  UI-241
//
//  Created by にゃんにゃん丸 on 2021/06/19.
//

import SwiftUI
import SpriteKit

struct Home: View {
    @State var selected : Trip = trips[0]
    var body: some View {
        ZStack{
            
            GeometryReader{proxy in
                
                let frame = proxy.frame(in:.global)
                
                
                Image(selected.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                    .cornerRadius(0)
                
            }
            .ignoresSafeArea()
            
            SpriteView(scene: Rainfall(),options: [.allowsTransparency])
            
            
            VStack{
                
                
                Text("Go To Trip")
                    .font(.system(size: 30))
                    .font(.footnote.italic())
                    .foregroundColor(.white)
                
                
                Text("TRIP")
                    .font(.largeTitle.weight(.heavy))
                    .foregroundColor(.white)
                    .padding(.top,10)
                
                
                
                VStack{
                    
                    GeometryReader{proxy in
                        
                        let frame = proxy.frame(in:.global)
                        
                        
                        
                        TabView(selection:$selected){
                            
                            
                            ForEach(trips){trip in
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: frame.width - 10, height: frame.height - 10)
                                    .tag(trip)
                                
                                
                                
                            }
                            
                        
                            
                            
                            
                            
                            
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                      
                        
                        
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.3)
                    
                    Text(selected.title)
                        .font(.title.italic())
                        .foregroundColor(.gray)
                        .padding(.bottom,5)
                    
                    PageController(currentapage: getIndex(), maxPage: trips.count)
                    
                
                    
                    
                  
                    
                    
                    
                    
                }
                .padding(.bottom)
                .padding(.horizontal,10)
                .background(Color.white.clipShape(customShape()))
               
               
               
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Get Started")
                        .font(.title.bold())
                        .foregroundColor(.primary)
                        .padding(.vertical,10)
                        .padding(.horizontal,10)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        .padding(.top,10)
                        
                })
                    
                    
                
                
            }
            .padding()
            
            
            
        }
    }
    func getIndex()->Int{
        
        let index = trips.firstIndex { (trip) in
        
            selected.id == trip.id
        } ?? 0
        
        return index
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

class Rainfall : SKScene{
    
    
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .aspectFill
        anchorPoint = CGPoint(x: 0.5, y: 1)
        
        backgroundColor = .clear
        
        let node = SKCropNode(fileNamed: "SparkFall.sks")!
        addChild(node)
        
       
    }
    
}

struct PageController : UIViewRepresentable {
    var currentapage : Int
    var maxPage : Int
    func makeUIView(context: Context) -> UIPageControl {
        
        
        let view = UIPageControl()
        
        view.backgroundStyle = .minimal
        
        
        view.currentPage = currentapage
        view.numberOfPages = maxPage
        
        return view
        
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        uiView.currentPage = currentapage
        
    }
}

struct customShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            

            let midWidth = rect.width  / 2

            
            
            path.addLine(to: CGPoint(x: midWidth - 80, y: rect.height))
           path.addLine(to: CGPoint(x: midWidth - 80, y: rect.height - 30))
          path.addLine(to: CGPoint(x: midWidth + 70, y: rect.height - 30))
           path.addLine(to: CGPoint(x: midWidth + 70, y: rect.height))
            
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
           path.addLine(to: CGPoint(x: rect.width, y: rect.height))
          path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            
            
            
        
            
            
        }
    }
}
