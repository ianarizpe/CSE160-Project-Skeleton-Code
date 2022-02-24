generic configuration NeighborC (){
    provides interface Neighbor;
}

implementation {
    components new NeighborP();
    Neighbor = NeighborP.Neighbor;



    //Lists
   components new PoolC(sendInfo, 20);
   components new QueueC(sendInfo*, 20);

   NeighborP.Pool -> PoolC;
   NeighborP.Queue -> QueueC;
    
}