generic configuration NeighborC (){
    provides interface Neighbor;
}

implementation {
    components new NeighborP();
    Neighbor = NeighborP.Neighbor;

   //components new TimerMilliC() as periodicTimer;
   //components RandomC as Random;
   //components new AMSenderC(channel);

   //Timers
   //NeighborP.periodicTimer -> periodicTimer;
  

  

    
    
}