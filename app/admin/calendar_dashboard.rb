ActiveAdmin.register_page "Calendar Dashboard" do
  menu priority: 2, label: "Calendar Dashboard"
 
  content do
    # Set the date variable, default to current date or use the params[:month] if available
    date = params[:month] ? Date.parse(params[:month]) : Date.today
 
    # Fetch orders for the given month
    orders = Order.includes(:client).where(finish: date.beginning_of_month..date.end_of_month)
 
    # Calculate previous and next months for navigation links
    previous_month = date.prev_month
    next_month = date.next_month
 
    # Navigation buttons for previous and next month
    div class: 'calendar-navigation', style: "margin-bottom: 20px; text-align: center;" do
      span do
        link_to "← Previous Month", admin_calendar_dashboard_path(month: previous_month.strftime('%Y-%m-%d')),
                class: "btn btn-outline-primary", style: "margin: 0 10px; padding: 5px 15px; color: #007bff; border: 1px solid #007bff; text-decoration: none; border-radius: 5px;"
      end
      span style: "font-size: 1.5rem; font-weight: bold; margin: 0 10px; display: inline-block;" do
        h2 "#{date.strftime('%B %Y')}"
      end
      span do
        link_to "Next Month →", admin_calendar_dashboard_path(month: next_month.strftime('%Y-%m-%d')),
                class: "btn btn-outline-primary", style: "margin: 0 10px; padding: 5px 15px; color: #007bff; border: 1px solid #007bff; text-decoration: none; border-radius: 5px;"
      end
    end
 
    # Calculate the start and end dates for the full weeks of the month
    start_date = date.beginning_of_month.beginning_of_week(:sunday)
    end_date = date.end_of_month.end_of_week(:sunday)
 
    # Render the calendar table
    table id: 'calendar-table', style: "width: 100%; table-layout: fixed; border-collapse: separate; border-spacing: 8px; border: 1px solid #ddd;" do
      thead do
        tr do
          %w[Sun Mon Tue Wed Thu Fri Sat].each do |day|
            th day, style: "padding: 8px; background-color: #e9ecef; text-align: center;"
          end
        end
      end
      tbody do
        (start_date..end_date).each_slice(7) do |week|
          tr do
            week.each do |date_day|
              # Fetch orders for the current day
              orders_on_this_day = orders.select { |order| order.finish == date_day }
 
              # Determine the highlight class and inline styling
              cell_style = if orders_on_this_day.any?
                             "background-image: linear-gradient(180deg, #e9b2b2, #bd6363); color: #ffffff;"  # Gradient background for days with orders
                           elsif date_day.saturday? || date_day.sunday?
                             "background-color: #f0f0f0;"  # Gray background for weekends
                           else
                             "background-color: #ffffff;"  # Default background for regular days
                           end
 
              # Render each day cell with the appropriate highlight class
              td style: "#{cell_style} border: 1px solid #ddd; padding: 10px; vertical-align: top; text-align: center; border-radius: 8px;" do
                strong date_day.day  # Display the day number
 
                # Display orders or "No orders" message
                if orders_on_this_day.any?
                  ul style: "padding: 0; list-style: none; margin: 10px 0 0 0;" do
                    orders_on_this_day.each do |order|
                      li style: "margin-bottom: 5px; font-size: 0.95rem;" do
                        strong order.client.name
                        small "Order ID: #{order.id}, Finish: #{order.finish.strftime('%B %d, %Y')}", style: "display: block; color: #f5f5f5;"
                      end
                    end
                  end
                else
                  # Message if there are no orders on this day
                  text_node "<p style='font-size: 0.85rem; color: #6c757d; margin-top: 10px;'>No orders finishing on this day</p>".html_safe
                end
              end
            end
          end
        end
      end
    end
  end
end