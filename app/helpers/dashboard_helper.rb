module DashboardHelper
  def average_conclusion_time(employee)
    if employee.service_orders.any?
      total_time = employee.service_orders.sum { |service_order| service_order.completed_at.present? ? service_order.completed_at - service_order.created_at : 0 }
      
      if total_time == 0 && employee.service_orders.any? { |service_order| service_order.completed_at.nil? }
        return "Nenhum serviço concluído"
      end

      average_time = total_time / employee.service_orders.count

      average_conclusion_time_in_hours = average_time / 1.hour

      days = average_time / 1.day
      hours = (average_time % 1.day) / 1.hour
      minutes = ((average_time % 1.day) % 1.hour) / 1.minute
      seconds = (((average_time % 1.day) % 1.hour) % 1.minute) / 1.second

      formatted_average_conclusion_time = "#{days.to_i} dias, #{hours.to_i} horas, #{minutes.to_i} minutos e #{seconds.to_i} segundos"

      formatted_average_conclusion_time
    else
      "Nenhum serviço realizado"
    end
  end

  def total_average_conclusion_time
    total_time = ServiceOrder.pluck(:completed_at, :created_at).compact.map { |completed_at, created_at| completed_at.present? ? completed_at - created_at : 0 }.sum

    if total_time == 0 && ServiceOrder.where(completed_at: nil).any?
      return "Nenhum serviço concluído"
    end

    average_time = total_time / ServiceOrder.count

    average_time_in_hours = average_time / 1.hour

    days = average_time / 1.day
    hours = (average_time % 1.day) / 1.hour
    minutes = ((average_time % 1.day) % 1.hour) / 1.minute
    seconds = (((average_time % 1.day) % 1.hour) % 1.minute) / 1.second

    formatted_average_conclusion_time = "#{days.to_i} dias, #{hours.to_i} horas, #{minutes.to_i} minutos e #{seconds.to_i} segundos"

    formatted_average_conclusion_time
  end
end
