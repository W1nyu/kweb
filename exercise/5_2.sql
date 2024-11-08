select users.id, users.name, tickets.seat_number
    from tickets join users on users.id = tickets.user and train = 11
    order by seat_number;

select users.id, users.name, count(*) as total_count, sum(tr
ains.distance) / 10 as total_distance
    from tickets join trains on trains.id =
tickets.train join users on users.id = tickets.user
    group by users.id
    order by distance desc limit 6;

select trains.id, types.name as type, src.name as src_stn, dst.name as dst_stn, timediff(arrival, departure) as travel_time
    from trains join types on types.id = trains.type join stations as src on src.id = trains.source join stations as dst on dst.id = trains.destination
    order by travel_time desc
    limit 6;

select types.name as type, src.name as src_stn, dst.name as dst_stn, trains.departure, trains.arrival, round(types.fare_rate * trains.distance / 1000, -2) as fare
    from trains join types on types.id = trains.type join stations as src on src.id = trains.source join stations as dst on dst.id = trains.destination
    order by departure;

select trains.id, types.name as type, src.name as src_stn, dst.name as dst_stn, count(*) as occupied, types.max_seats as maximum
    from tickets join trains on trains.id = tickets.train join types on types.id = trains.type join stations as src on src.id = trains.source join stations as dst on dst.id = trains.destination
    group by tickets.train
    order by trains.id;

select trains.id, types.name as type, src.name as src_stn, dst.name as dst_stn, count(tickets.id) as occupied, types.max_seats as maximum
    from tickets right join trains on trains.id = tickets.train join types on types.id = trains.type join stations as src on src.id = trains.source join stations as dst on dst.id = trains.destination
    group by tickets.train
    order by trains.id;