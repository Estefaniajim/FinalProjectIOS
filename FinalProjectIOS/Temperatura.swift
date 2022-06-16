//
//  Temperatura.swift
//  FinalProjectIOS
//
//  Created by Estefania Jimenez Garcia  on 11/06/22.
//

import Foundation
import SwiftUI

struct Temperatura: View {
    var body: some View {
        FinalView()
    }
}

struct Temperatura_Previews: PreviewProvider {
    static var previews: some View {
        Temperatura()
    }
}
extension Color {
    static let darkStart = Color("darkstart")
    static let darkEnd = Color("darkend")
}



extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topTrailing, endPoint: .bottomTrailing)
    }
}




//look 1
 let gradient = AngularGradient(
    gradient: Gradient(colors: [Color.red, Color.pink , Color.yellow , Color.orange , Color.green , Color.blue , Color("indigo") , Color("violet")]),
    center: .center,
    startAngle: .degrees(340),
    endAngle: .degrees(0))

let gradient2 = AngularGradient(
   gradient: Gradient(colors: [Color.green, Color.orange , Color.yellow , Color.pink , Color.red ]),
   center: .center,
   startAngle: .degrees(340),
   endAngle: .degrees(0))

let gradient3 = AngularGradient(
   gradient: Gradient(colors: [Color.blue, Color("indigo") , Color("violet") , Color.pink , Color.red ]),
   center: .center,
   startAngle: .degrees(340),
   endAngle: .degrees(0))


struct FinalView: View {
    var body: some View {
        ZStack{
            LinearGradient(Color.darkStart, Color.darkEnd).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                ZStack{
                CircularSlider()
                    .rotationEffect(.degrees(180))
                
                NumberLayers()
                    .rotationEffect(.degrees(180))
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                       Cards(txt: "Temperatura", activity: "P R E N D I D O", sysimages: "fork.knife" ,opacityVal: 1)
                            .shadow(color: .blue, radius: 1, x: 1, y: 1)
                    }.padding()
                      
                }.offset(x: 60, y: 20)
                
            }
            
            TitleSection()
                .offset(x: 0, y: -380)
        }
    }
}


struct CircularSlider: View {
    
    @State var progress : CGFloat = 0
    @State var angle : Double = 0
    
    var body: some View{
        
        VStack{
            ZStack{
                
                
                
                ZStack{
                Image("pod2")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(1)
                    .shadow(color: .blue.opacity(0.2), radius: 5, x: 10, y: 10)
                    .shadow(color: .pink.opacity(0.2), radius: 5, x: -10, y: -10)
                    
                }.rotationEffect(.degrees(180))
                
                
                
                
                
                Circle()
                    .stroke(Color.black ,style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                    .frame(width: 200, height: 200)
                    
                
                ZStack{
                
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(gradient ,style: StrokeStyle(lineWidth: 30, lineCap: .round))
                        .frame(width: 200, height: 200)
                        .rotationEffect(.init(degrees: -90))
                        
                    
                    }
                
               Circle()
                    .fill( LinearGradient(Color.darkStart, Color.darkEnd))
                    .frame(width: 46, height: 46)
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                            }
                    .offset(x: 200 / 2)
                    .rotationEffect(.init(degrees: angle))
                    .shadow(color: .black, radius: 2, x: -5, y: -5)
            
                    .gesture(DragGesture().onChanged(onDrag(value:)))
                    .rotationEffect(.init(degrees: -90))
                
                HStack{
                    
                    Text(String(format: "%.0f", progress * 100))
                    .foregroundColor(.blue)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .frame(width: 130)
                    .padding()
                    
                    Text("º")
                       .foregroundColor(.blue)
                       .font(.system(size: 30))
                       .fontWeight(.semibold)
                   
                    
                }.offset(x: 0, y: 140)
                .rotationEffect(.degrees(180))
            }
        }
    }
    
    func onDrag(value: DragGesture.Value){
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        var angle = radians * 180 / .pi
        if angle < 0{angle = 360 + angle}
        withAnimation(Animation.linear(duration: 0.15)){
            
            // progress...
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
    }
}

struct NumberLayers: View {
    var body: some View {
        ZStack{
           
            Text("3")
                .font(.subheadline)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .offset(x: 0, y: -130)
                .rotationEffect(.degrees(45))
            
            
            Text("5")
                .font(.subheadline)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .offset(x: 0, y: -130)
                .rotationEffect(.degrees(90))
            
            Text("7")
                .font(.subheadline)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .offset(x: 0, y: -130)
                .rotationEffect(.degrees(135))
            
            Text("9")
                .font(.subheadline)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .offset(x: 0, y: -130)
                .rotationEffect(.degrees(180))
            
            Text("11")
                .font(.subheadline)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .offset(x: 0, y: -130)
                .rotationEffect(.degrees(225))
            
            
            Text("13")
                .font(.subheadline)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .offset(x: 0, y: -130)
                .rotationEffect(.degrees(270))
            
            Text("15")
                .font(.subheadline)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .offset(x: 0, y: -130)
                .rotationEffect(.degrees(315))
        }
    }
}


struct Cards: View {
    
    @State var txt = ""
    @State var activity = ""
    @State var sysimages = ""
    @State var opacityVal : CGFloat = 0
  
    
    var body: some View {
        ZStack{
         
            HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .opacity(0.4)
                    .frame(width: 180, height: 250)
                    
                
                VStack{
                    
                    Text (txt)
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .opacity(opacityVal)
                    
                    Spacer().frame(height : 20)
                    
                    Image(systemName: sysimages)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .opacity(opacityVal)
                     
                    Spacer().frame(height : 20)
                    
                    Text (activity)
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .opacity(opacityVal)
                       
                }.padding()
             }
            
          }
       }
    }
}


struct TitleSection: View {
    @State private var heartTap = false
    var body: some View {
        HStack{
            Text("H O M E P O D")
                .font(.title)
                .foregroundColor(.white)
            
            Spacer().frame(width: 15, height: 10)
            
            Text("M I N I")
                .font(.title3)
                .foregroundColor(.white)
            
            Spacer().frame(width: 90, height: 0)
            
            
            ZStack{
            Image(systemName: "heart")
                .resizable()
                .frame(width: 30, height: 28)
                .foregroundColor(.white)
                .gesture(
                   TapGesture()
                        .onEnded({
                            heartTap.toggle()
                        })
                                      
                )
                
                if heartTap {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .foregroundColor(.red)
                }
            }
            
            
             
        }.padding()
    }
}
