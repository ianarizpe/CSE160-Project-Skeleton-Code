generic configuration NeighborC (){
    provides interface Neighbor;
}

implementation {
    components new NeighborP();
    Neighbor = NeighborP.Neighbor;

   components new TimerMilliC() as periodicTimer;
   components RandomC as Random;
   //components new AMSenderC(channel);

   //Timers
   NeighborP.periodicTimer -> periodicTimer;
   NeighborP.Random -> Random;

  

    //Lists
   components new PoolC(sendInfo, 20);
   components new QueueC(sendInfo*, 20);

   NeighborP.Pool -> PoolC;
   NeighborP.Queue -> QueueC;
    
}