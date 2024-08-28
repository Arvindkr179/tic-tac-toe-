import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> board=['','','','','','','','',''];

  bool oturn=true,finished=false;



  int Oscore=0;
  int Xscore=0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(centerTitle:true,title: Text("TIC-TAC-TOE"),
      elevation: 5,),
      body:
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                  child: Column(
                    children: [
                      Text("Score Board",style: TextStyle(fontSize: 30),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text("Player 0 : "+Oscore.toString(),style: TextStyle(fontSize: 20))
                      ,
                        Text("Player X : "+Xscore.toString(),style: TextStyle(fontSize: 20))
                      ],)
                    ],
                  ))
            ,
            Expanded(
                flex:7,
                child: GridView.builder(
              itemCount:9,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index) {
              return GestureDetector(
                onTap:() {
                  if(!finished){
                    Selected(index);
                  }

                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
                      color: Colors.white)
                  ,
                  child: Center(child: Text(board[index],style: TextStyle(fontSize: 30,color:board[index]=="O"?Colors.blue:Colors.black))),

                ),

              );
            },)),

            Expanded(
                flex:1,
                child: ElevatedButton(onPressed: () {
                  setState(() {
                    board=['','','','','','','','',''];

                    oturn=true;
                    Oscore=0;
                    Xscore=0;
                    finished=false;
                  });
                },
                child: Text(finished?"Play Again":"Reset"))

          ),]
        )
    ));}


  void Selected(int index) {
    if(oturn && board[index]==''){
      setState(() {
        board[index]='O';
      });
    }
    else if(!oturn && board[index]==""){
      setState(() {
        board[index]='X';
      });
    }
    oturn =!oturn;
    checkWinner();
  }

  void checkWinner() {
    //row 1
    if(board[0]==board[1] && board[0]==board[2] && board[0]!=""){
      setState(() {
        if(board[0]=='O'){
          Oscore++;
        }
        else if(board[0]=='X'){
          Xscore++;
        }



        finished=true;
      });
    }
    //Row 2
    else if(board[3]==board[4] && board[3]==board[5] && board[3]!=""){
      setState(() {
        if(board[3]=='O'){
          Oscore++;
        }
        else if(board[3]=='X'){
          Xscore++;
        }



        finished=true;
      });
    }
    //row 3
    else if(board[6]==board[7] && board[6]==board[8] && board[6]!=""){
      setState(() {
        if(board[6]=='O'){
          Oscore++;
        }
        else if(board[6]=='X'){
          Xscore++;
        }



        finished=true;
      });
    }
    //column 1
    else if(board[0]==board[3] && board[0]==board[6] && board[0]!=""){
      setState(() {
        if(board[0]=='O'){
          Oscore++;
        }
        else if(board[0]=='X'){
          Xscore++;
        }


        finished=true;
      });
    }
    //column 2

    else if(board[1]==board[4] && board[1]==board[7] && board[1]!=""){
      setState(() {
        if(board[1]=='O'){
          Oscore++;
        }
        else if(board[1]=='X'){
          Xscore++;
        }

        finished=true;

      });
    }
    //column 3

    else if(board[2]==board[5] && board[2]==board[8] && board[2]!=""){
      setState(() {
        if(board[2]=='O'){
          Oscore++;
        }
        else if(board[2]=='X'){
          Xscore++;
        }

        finished=true;

      });
    }
    //diagonal 1
    else if(board[0]==board[4] && board[0]==board[8] && board[0]!=""){
      setState(() {
        if(board[0]=='O'){
          Oscore++;
        }
        else if(board[0]=='X'){
          Xscore++;
        }

        finished=true;



      });
    }
    //diagonal 2
    else if(board[2]==board[4] && board[2]==board[6] && board[2]!=""){
      setState(() {
        if(board[2]=='O'){
          Oscore++;
        }
        else if(board[2]=='X'){
          Xscore++;
        }
        finished=true;


      });
    }

  }
}
