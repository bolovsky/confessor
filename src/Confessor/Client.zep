namespace Confessor;

/**
 * Client/probe for confessor
 */
class Client
{
    protected port;

    protected host;

    protected sock;

    public function __construct(string host = "localhost", int port = 9675)
    {
        let this->host = host;
        let this->port = port;
        this->connect();
    }

    public function send(string message)
    {
        socket_write(this->sock, message);
    }

    protected function connect()
    {
        let this->sock = socket_create(AF_INET, SOCK_STREAM, 0);
        socket_connect(this->sock, this->host, this->port);
    }
}
