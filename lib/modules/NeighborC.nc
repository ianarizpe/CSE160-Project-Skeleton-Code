generic configuration NeighborC (){
    provides interface Neighbor;
}

implementation {
    components new NeighborP();
    Neighbor = NeighborP.Neighbor;
    
}