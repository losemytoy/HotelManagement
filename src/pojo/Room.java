package pojo;

public class Room {
    private String room_id;
    private String room_stat;
    private String room_price;

    public String getRoom_id() {
        return room_id;
    }

    public String getRoom_price() {
        return room_price;
    }

    public void setRoom_price(String room_price) {
        this.room_price = room_price;
    }

    public void setRoom_id(String room_id) {

        this.room_id = room_id;
    }

    public String getRoom_stat() {
        return room_stat;
    }

    public void setRoom_stat(String room_stat) {
        this.room_stat = room_stat;
    }
}
