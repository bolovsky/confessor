namespace Confessor;

/**
 * Server base for confessor
 */
class Server
{
    /**
     * @param int port
     */
    protected port;

    /**
     * @param string host
     */
    protected host;

    /**
     * @param resource sock
     */
    protected sock;

    /**
     * @param string $host
     * @param int $port
     */
    public function __construct(string host = "localhost", int port = 9675)
    {
        let this->host = host;
        let this->port = port;
    }

    public function up()
    {
        if null === this->sock {
            this->connect();
        }

        loop {
            var client = socket_accept(this->sock);
            var input = socket_read(client, 2024);

            if "exit" === input {
                break;
            }

            echo input . "\n";
        }
    }

    protected function connect()
    {
        let this->sock = socket_create(AF_INET, SOCK_STREAM, 0);
        var bind = socket_bind(this->sock, this->host, this->port);
        socket_listen(this->sock);
        ob_implicit_flush();
    }
}
