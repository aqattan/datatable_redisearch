class PeopleDatatable
  delegate :params, :link_to, :check_box_tag, :number_to_currency, to: :@view
  def initialize(view)
    @view = view
  end
  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Person.count,
      aaData: data,
      iTotalDisplayRecords: @total_entries || total_entries
    }
  end
private
  def data
    people.map do |pl|
      [
        "<a href='/people/#{pl.id}'>#{pl.first_name}</a>",
        pl.last_name,
        pl.ssn,
        pl.date_of_birth,
        pl.address1,
        pl.address2,
        pl.city,
        pl.state,
        pl.postal_code,
        pl.phone_number,
        pl.account_number
      ]
    end
  end
  def people
    @people ||= fetch_people
  end
  def search_record
    search_result =
      Person.where(first_name: Person.ft_sugget(attribute: 'first_name', prefix: params[:sSearch])) +
      Person.where(last_name: Person.ft_sugget(attribute: 'last_name', prefix: params[:sSearch])) +
      Person.where(ssn: Person.ft_sugget(attribute: 'ssn', prefix: params[:sSearch])) +
      Person.where(date_of_birth: Person.ft_sugget(attribute: 'date_of_birth', prefix: params[:sSearch])) +
      Person.where(address1: Person.ft_sugget(attribute: 'address1', prefix: params[:sSearch])) +
      Person.where(address2: Person.ft_sugget(attribute: 'address2', prefix: params[:sSearch])) +
      Person.where(city: Person.ft_sugget(attribute: 'city', prefix: params[:sSearch])) +
      Person.where(state: Person.ft_sugget(attribute: 'state', prefix: params[:sSearch])) +
      Person.where(postal_code: Person.ft_sugget(attribute: 'postal_code', prefix: params[:sSearch])) +
      Person.where(phone_number: Person.ft_sugget(attribute: 'phone_number', prefix: params[:sSearch])) +
      Person.where(account_number: Person.ft_sugget(attribute: 'account_number', prefix: params[:sSearch]))
    start_index = (page - 1) * per_page
    stop_index = start_index + per_page
    @total_entries = search_result.count
    search_result[start_index...stop_index]
  end
  def fetch_people
    if  params[:sSearch].present?
      return search_record
    end
    people = Person.order("#{sort_column} #{sort_direction}")
    people = people.page(page).per_page(per_page)
    people
  end
  def total_entries
    if people.respond_to? :total_entries
      return people.total_entries
    end
    people.count
  end
  def page
    params[:iDisplayStart].to_i/per_page + 1
  end
  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end
  def sort_column
    columns = %w[first_name date_of_birth phone_number]
    columns[params[:iSortCol_0].to_i]
  end
  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
