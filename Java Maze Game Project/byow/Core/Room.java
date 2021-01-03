package byow.Core;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import byow.TileEngine.TERenderer;
import byow.TileEngine.TETile;
import byow.TileEngine.Tileset;

public class Room {
    public static final int WIDTH = 80;
    public static final int HEIGHT = 50;
    private Position LL;
    private Position UR;
    private Position UL;
    private Position LR;
    private Position center;
    private List<Position> midPoints = new ArrayList<>();
    //Make rectangular rooms of lengths/widths between 3 - 7.
    public Room(TETile[][] world, long seed) {
        Random ran = new Random(seed);
        for (int i = 0; i < WIDTH; i++) {
            for (int j = 0; j < HEIGHT; j++) {
                world[i][j] = Tileset.NOTHING;
            }
        }
        // Attempting to create some number of rooms, actual may be less.
        for (int roomAttempts = 0; roomAttempts < 40; roomAttempts += 1) {
            int startx = ran.nextInt(48);
            int starty = ran.nextInt(18);
            int xlength = ran.nextInt(3) + 4;
            int ylength = ran.nextInt(3) + 4;
            LL = new Position(startx, starty);
            UR = new Position(startx + xlength, starty + ylength);
            UL = new Position(startx, starty + ylength);
            LR = new Position(startx + xlength, starty);
            center = new Position(startx + xlength / 2, starty + ylength / 2);
            // If room overlaps with existing room, dont add it.
            if (overlaps(world)) {
                continue;
            }
            midPoints.add(center);
            // Otherwise add the room.
            for (int x = startx; x < startx + xlength; x += 1) {
                for (int y = starty; y < starty + ylength; y += 1) {
                    world[x][y] = Tileset.WALL;
                }
            }
            for (int x = startx + 1; x < startx + xlength - 1; x += 1) {
                for (int y = starty + 1; y < starty + ylength - 1; y += 1) {
                    world[x][y] = Tileset.FLOOR;
                }
            }
            addHallway(world, midPoints);
        }
    }

    private void addHallway(TETile[][] world, List<Position> points) {
        for (Position point: points) {
            hallwayHelper(world, point);
        }
    }

    private void hallwayHelper(TETile[][] world, Position midPoint) {
        int xPos = midPoint.getX();
        int yPos = midPoint.getY();
        for (int i = xPos + 2; i < WIDTH / 2; i++) {
            world[i][yPos + 1] = Tileset.WALL;
            world[i][yPos] = Tileset.FLOOR;
            world[i][yPos - 1] = Tileset.WALL;
        }
        for (int i = xPos - 2; i > WIDTH / 2; i--) {
            world[i][yPos + 1] = Tileset.WALL;
            world[i][yPos] = Tileset.FLOOR;
            world[i][yPos - 1] = Tileset.WALL;
        }
        for (int j = yPos; j < HEIGHT / 2; j++) {
            world[xPos][j] = Tileset.WALL;
            world[xPos][j] = Tileset.FLOOR;
            world[xPos][j] = Tileset.WALL;
        }
        for (int j = yPos; j > HEIGHT / 2; j--) {
            world[xPos][j] = Tileset.WALL;
            world[xPos][j] = Tileset.FLOOR;
            world[xPos][j] = Tileset.WALL;
        }
    }

    public boolean overlaps(TETile[][] world) {
        if (world[LL.getX()][LL.getY()] != Tileset.NOTHING
                || world[LR.getX()][LR.getY()] != Tileset.NOTHING
                || world[UL.getX()][UL.getY()] != Tileset.NOTHING
                || world[UR.getX()][UR.getY()] != Tileset.NOTHING
                || world[center.getX()][center.getY()] != Tileset.NOTHING

        ) {
            return true;
        }
        return false;
    }


    public static void main(String[] args) {
        // Create blank world.
        TERenderer ter = new TERenderer();
        ter.initialize(WIDTH, HEIGHT);
        TETile[][] world = new TETile[WIDTH][HEIGHT];
        Room room1 = new Room(world, 5);
        ter.renderFrame(world);
    }
}
