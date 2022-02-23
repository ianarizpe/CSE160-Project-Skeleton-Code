generic configuration NeighborC{
    provides interface Neighbor;
}

implementation {
    components new NeighborDiscoveryP();
    Neighbor = NeighborDiscoveryP.Neighbor;
    
}