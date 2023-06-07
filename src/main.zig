const std = @import("std");

const User = struct {
    email: []const u8,
    visits: u32,
};

fn visitUser() User {
    const state = struct {
        var x: i32 = 1234;
        var user = User{
            .email = "my@email.com",
            .visits = 0,
        };
    };

    state.user.visits += 1;
    return state.user;
}

pub fn main() void {
    _ = visitUser();
    _ = visitUser();
    const user = visitUser();
    std.log.info("user's website has been visited {} times.", .{user.visits});
}
