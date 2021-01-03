package bearmaps.proj2ab;
import java.util.List;
public class KDTree {

    private Node root;
    // 1 mean it is x, -1 mean it is y
    private int direction = 1;
    /**
     * He used a helper method to add in number.
     * he have a root node as an instance variable
     * add method takes a point and a node
     */
    private static class Node {
        private Point p;
        private Node posSide;
        private Node negSide;
        private boolean orient;
        Node(Point p, int or) {
            this.p = p;
            // true mean it is x, false mean it is y
            if (or == -1) {
                this.orient = false;
            } else {
                this.orient = true;
            }
        }
        public double distance(Point goal) {
            return Math.sqrt(Point.distance(p, goal));
        }
    }
    /**
     *
     * @param points has at least size 1
     */
    public KDTree(List<Point> points) {
        root = new Node(points.get(0), 1);
        for (int i = 1; i < points.size(); i++) {
            root = add(root, points.get(i));
        }
    }

    private Node add(Node node, Point p) {
        if (node == null) {
            direction *= -1;
            return new Node(p, direction);
        }
        double nodeX =  node.p.getX();
        double nodeY = node.p.getY();
        if (node.orient) {
            if (p.getX() >= nodeX && p.getY() != nodeY) {
                node.posSide = add(node.posSide, p);
            } else if (p.getX() < nodeX) {
                node.negSide = add(node.negSide, p);
            } else {
                return new Node(p, direction);
            }
        } else {
            if (p.getY() >= nodeY && p.getX() != nodeX) {
                node.posSide = add(node.posSide, p);
            } else if (p.getY() < nodeY) {
                node.negSide = add(node.negSide, p);
            } else {
                return new Node(p, direction);
            }
        }
        return node;
    }

    /**
     * This should take O(N) time on average, where n is the number of points.
     * @param x coordinate
     * @param y coordinate
     * @return the coseset point ot the inputted coordinates.
     */
    public Point nearest(double x, double y) {
        Point goal = new Point(x, y);
        Node best = root;
        return nearest(root, goal, best).p;
    }
    private Node nearest(Node cur, Point goal, Node best) {
        if (cur == null) {
            return best;
        }
        Node goodSide;
        Node badSide;
        double bestDis = best.distance(goal);
        if (cur.distance(goal) < bestDis) {
            best = cur;
            bestDis = cur.distance(goal);
        }
        if (cur.orient) {
            if (goal.getX() < cur.p.getX()) {
                goodSide = cur.negSide;
                badSide = cur.posSide;
            } else {
                goodSide = cur.posSide;
                badSide = cur.negSide;
            }
        } else {
            if (goal.getY() < cur.p.getY()) {
                goodSide = cur.negSide;
                badSide = cur.posSide;
            } else {
                goodSide = cur.posSide;
                badSide = cur.negSide;
            }
        }
        best = nearest(goodSide, goal, best);
        bestDis = best.distance(goal);
        double diffX = Math.abs(goal.getY() - cur.p.getY());
        double diffY = Math.abs(goal.getX() - cur.p.getX());
        if (diffX < bestDis || diffY < bestDis) {
            best = nearest(badSide, goal, best);
        }
        return best;
    }
}
