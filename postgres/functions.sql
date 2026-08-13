CREATE OR REPLACE FUNCTION calculate_order_total(p_order_id BIGINT)
RETURNS NUMERIC AS $$
DECLARE
    result NUMERIC;
BEGIN
    SELECT COALESCE(SUM(quantity * unit_price), 0)
    INTO result
    FROM order_items
    WHERE order_id = p_order_id;

    RETURN result;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION refresh_order_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE orders
    SET total_amount = calculate_order_total(NEW.order_id)
    WHERE order_id = NEW.order_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
