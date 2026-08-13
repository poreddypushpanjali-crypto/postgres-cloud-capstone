CREATE TRIGGER trg_refresh_order_total
AFTER INSERT OR UPDATE ON order_items
FOR EACH ROW
EXECUTE FUNCTION refresh_order_total();
