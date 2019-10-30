defmodule Practice do

  def greet() do
    IO.puts("Hello world")
  end

  def fact(1) do
    1
  end

  def fact(n) do
    n*fact(n-1)
  end

  def create_sound(params) do
   %{
      frequency: params.frequency,
      volume: params.volume,
      pitch: params.pitch

    }
    |> insert()
  end

  def insert(data) do
    %{data: data}
  end

  end

defmodule Crypt do
  def uuid() do
    Integer.to_string(:rand.uniform(4294967296), 32) <> Integer.to_string(:rand.uniform(4294967296), 32)
  end
end

defmodule Service do
  defstruct uuid: nil, offering: :none
end

defmodule ServiceProvider do
  defstruct [uuid: nil, services: [], orders: []]
  alias Order

  def start() do
    Agent.start_link(fn -> %__MODULE__{uuid: Crypt.uuid, services: [], orders: []  } end, name: __MODULE__)
  end

  def all() do
    Agent.get(__MODULE__, fn(struct) -> struct end)
  end

  def orders() do
    Agent.get(__MODULE__, fn(struct) -> struct.orders end)
  end

  # def add(%Order{} = order) do
  #   Agent.update(__MODULE__,
  #   fn(struct) ->
  #     %{struct | orders: [order | struct.orders]}
  #   end)
  # end

  # def add(%Service{} = service) do
  #   Agent.update(__MODULE__,
  #   fn(struct) ->
  #     %{struct | services: [service | struct.services]}
  #   end)
  # end

end

defmodule ServiceBroker do
  defstruct providers: [], pairings: []

  def start_link() do
    Agent.start_link(fn -> %__MODULE__{providers: [], pairings: [] } end, name: __MODULE__)
  end


  def add(%ServiceProvider{} = sp) do
    Agent.update(__MODULE__,
    fn(struct) ->
    %{struct | providers: [sp | struct.providers]}
    end)
  end

  def sps() do
    Agent.get(__MODULE__, fn(struct) -> struct.providers end)
  end


  def pair() do
    # get all ServiceProviders Enumerable of ServiceProvider
    # get all request orders
    #  dispatch requests to SPs(orders) where request.order.subject matches sp.services.offering
    sps = sps()
    reqs = Requests.all
{sps, reqs}

  end

end


defmodule Order do
  defstruct [user: nil, subject: :none]
end

defmodule Requests do
  alias Order
  defstruct [orders: []]

  # Starts the Requests process with empty orders
  def start_link() do
    Agent.start_link(fn -> %__MODULE__{orders: [] } end, name: __MODULE__)
  end

# Fetch all orders
  def all() do
     Agent.get(__MODULE__, fn(struct) -> struct.orders end)
  end


  #Add new order to list
  def add(%Order{} = order) do
    Agent.update(__MODULE__,
    fn(struct) ->
      %{struct | orders: [order | struct.orders]}
    end)

  end

end


