generic configuration NeighborC (){
    provides interface Neighbor;
}

implementation {
    components new NeighborP();
    Neighbor = NeighborP.Neighbor;

   components new TimerMilliC() as sendTimer;
   components RandomC as Random;
   components new AMSenderC(channel);

   //Timers
   NeighborP.sendTimer -> sendTimer;
   NeighborP.Random -> Random;

   NeighborP.Packet -> AMSenderC;
   NeighborP.AMPacket -> AMSenderC;
   NeighborP.AMSend -> AMSenderC;

    //Lists
   components new PoolC(sendInfo, 20);
   components new QueueC(sendInfo*, 20);

   NeighborP.Pool -> PoolC;
   NeighborP.Queue -> QueueC;
    
}