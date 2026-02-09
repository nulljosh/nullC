// Level 8: Struct definitions and usage
struct Point {
    int x;
    int y;
};

struct Rectangle {
    struct Point top_left;
    struct Point bottom_right;
};

int calculate_area(struct Rectangle rect) {
    int width = rect.bottom_right.x - rect.top_left.x;
    int height = rect.bottom_right.y - rect.top_left.y;
    return width * height;
}

int main() {
    struct Rectangle r;
    r.top_left.x = 0;
    r.top_left.y = 0;
    r.bottom_right.x = 10;
    r.bottom_right.y = 5;
    
    return calculate_area(r);
}
