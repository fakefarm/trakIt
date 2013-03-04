module SerialNumbersHelper
  
  #assigned_serial_number.html.haml
  def assigned_user_to_serial_number(serial_number)
    serial_number.user.name unless serial_number.user.nil?
  end

  #show 
  def serial_no
    @serial_number.asset.name unless @serial_number.asset.name.nil?
  end
end
