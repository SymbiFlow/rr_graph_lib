#include "rr_graph_uxsdcxx.capnp.h"

namespace graph2 {

class RrEdgesInserter {
public:
    void init(capnp::MessageBuilder base, unsigned int num_edges) {
        builder_ = base.getRoot<ucap::RrGraph>().getRrEdges();
        edges_ = builder_.initEdges(num_edges);
    }

    void add_edge(
            unsigned int index,
            unsigned int src_node, unsigned int sink_node, unsigned int switch_id) {
        auto edge = edges_[index];
        edge.setSrcNode(src_node);
        edge.setSinkNode(sink_node);
        edge.setSwitchId(switch_id);
    }
private:
    ucap::RrEdges::Builder builder_;
    ::capnp::List< ::ucap::Edge,  ::capnp::Kind::STRUCT>::Builder edges_;

};

} // namespace graph2
